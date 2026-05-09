; lissajous.asm -- Lissajous curve (x=sin(3t), y=sin(2t)) drawn with LINE segments
; Approximated with pre-computed sin table values scaled to 256x256 screen

; Draw dark background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x0A0A14
RECTF r0, r1, r2, r3, r4

; Center offset = 128
LDI r30, 128

; Draw Lissajous curve: x = 128 + 100*sin(3t), y = 128 + 100*sin(2t)
; 24 segments approximating the curve with pre-computed endpoints
; sin values scaled *100, then offset by 128

; We'll draw 24 line segments. Each endpoint pre-computed from sin tables.
; Using register pairs: r10=x1, r11=y1, r12=x2, r12=y2 (reuse)

; Color: bright cyan
LDI r31, 0x00FFDD

; Segment 0: t=0 => x=128+0=128, y=128+0=128
LDI r10, 128
LDI r11, 128
; t=pi/12 => sin(3*pi/12)=sin(pi/4)=0.707*100=71, sin(2*pi/12)=sin(pi/6)=0.5*100=50
LDI r12, 199
LDI r13, 178
LINE r10, r11, r12, r13, r31

; Segment 1: t=pi/12 => x=199, y=178
LDI r10, 199
LDI r11, 178
; t=2pi/12 => sin(pi/2)=100, sin(pi/3)=87
LDI r12, 228
LDI r13, 215
LINE r10, r11, r12, r13, r31

; Segment 2: t=2pi/12 => x=228, y=215
LDI r10, 228
LDI r11, 215
; t=3pi/12 => sin(3pi/4)=71, sin(pi/2)=100
LDI r12, 199
LDI r13, 228
LINE r10, r11, r12, r13, r31

; Segment 3: t=3pi/12 => x=199, y=228
LDI r10, 199
LDI r11, 228
; t=4pi/12 => sin(pi)=0, sin(2pi/3)=87
LDI r12, 128
LDI r13, 215
LINE r10, r11, r12, r13, r31

; Segment 4: t=4pi/12 => x=128, y=215
LDI r10, 128
LDI r11, 215
; t=5pi/12 => sin(5pi/4)=-71, sin(5pi/6)=50
LDI r12, 57
LDI r13, 178
LINE r10, r11, r12, r13, r31

; Segment 5: t=5pi/12 => x=57, y=178
LDI r10, 57
LDI r11, 178
; t=6pi/12 => sin(3pi/2)=-100, sin(pi)=0
LDI r12, 28
LDI r13, 128
LINE r10, r11, r12, r13, r31

; Segment 6: t=6pi/12 => x=28, y=128
LDI r10, 28
LDI r11, 128
; t=7pi/12 => sin(7pi/4)=-71, sin(7pi/6)=-50
LDI r12, 57
LDI r13, 78
LINE r10, r11, r12, r13, r31

; Segment 7: t=7pi/12 => x=57, y=78
LDI r10, 57
LDI r11, 78
; t=8pi/12 => sin(2pi)=0, sin(4pi/3)=-87
LDI r12, 128
LDI r13, 41
LINE r10, r11, r12, r13, r31

; Segment 8: t=8pi/12 => x=128, y=41
LDI r10, 128
LDI r11, 41
; t=9pi/12 => sin(9pi/4)=sin(pi/4)=71, sin(3pi/2)=-100
LDI r12, 199
LDI r13, 28
LINE r10, r11, r12, r13, r31

; Segment 9: t=9pi/12 => x=199, y=28
LDI r10, 199
LDI r11, 28
; t=10pi/12 => sin(5pi/2)=sin(pi/2)=100, sin(5pi/3)=-87
LDI r12, 228
LDI r13, 41
LINE r10, r11, r12, r13, r31

; Segment 10: t=10pi/12 => x=228, y=41
LDI r10, 228
LDI r11, 41
; t=11pi/12 => sin(11pi/4)=sin(3pi/4)=71, sin(11pi/6)=-50
LDI r12, 199
LDI r13, 78
LINE r10, r11, r12, r13, r31

; Segment 11: t=11pi/12 => x=199, y=78
LDI r10, 199
LDI r11, 78
; t=12pi/12=pi => sin(3pi)=0, sin(2pi)=0
LDI r12, 128
LDI r13, 128
LINE r10, r11, r12, r13, r31

; Second half (t=pi to 2pi) mirrors the first
; Segment 12: t=pi => x=128, y=128
LDI r10, 128
LDI r11, 128
; t=13pi/12 => sin(13pi/4)=sin(pi/4)=-71, sin(13pi/6)=sin(pi/6)=50
LDI r12, 57
LDI r13, 178
LINE r10, r11, r12, r13, r31

; Segment 13: t=13pi/12 => x=57, y=178
LDI r10, 57
LDI r11, 178
; t=14pi/12 => sin(14pi/4)=sin(7pi/2)=-100, sin(14pi/6)=sin(7pi/3)=-87
LDI r12, 28
LDI r13, 41
LINE r10, r11, r12, r13, r31

; Segment 14: t=14pi/12 => x=28, y=41
LDI r10, 28
LDI r11, 41
; t=15pi/12 => sin(15pi/4)=sin(7pi/4)=-71, sin(15pi/6)=sin(5pi/2)=100
LDI r12, 57
LDI r13, 228
LINE r10, r11, r12, r13, r31

; Segment 15: t=15pi/12 => x=57, y=228
LDI r10, 57
LDI r11, 228
; t=16pi/12 => sin(16pi/4)=sin(4pi)=0, sin(16pi/6)=sin(8pi/3)=-87
LDI r12, 128
LDI r13, 41
LINE r10, r11, r12, r13, r31

; Segment 16: t=16pi/12 => x=128, y=41
LDI r10, 128
LDI r11, 41
; t=17pi/12 => sin(17pi/4)=sin(pi/4)=71, sin(17pi/6)=sin(5pi/6)=50
LDI r12, 199
LDI r13, 178
LINE r10, r11, r12, r13, r31

; Segment 17: t=17pi/12 => x=199, y=178
LDI r10, 199
LDI r11, 178
; t=18pi/12 => sin(18pi/4)=sin(9pi/2)=sin(pi/2)=100, sin(18pi/6)=sin(3pi)=0
LDI r12, 228
LDI r13, 128
LINE r10, r11, r12, r13, r31

; Segment 18: t=18pi/12 => x=228, y=128
LDI r10, 228
LDI r11, 128
; t=19pi/12 => sin(19pi/4)=sin(3pi/4)=71, sin(19pi/6)=sin(7pi/6)=-50
LDI r12, 199
LDI r13, 78
LINE r10, r11, r12, r13, r31

; Segment 19: t=19pi/12 => x=199, y=78
LDI r10, 199
LDI r11, 78
; t=20pi/12 => sin(20pi/4)=sin(5pi)=0, sin(20pi/6)=sin(10pi/3)=87
LDI r12, 128
LDI r13, 215
LINE r10, r11, r12, r13, r31

; Segment 20: t=20pi/12 => x=128, y=215
LDI r10, 128
LDI r11, 215
; t=21pi/12 => sin(21pi/4)=sin(5pi/4)=-71, sin(21pi/6)=sin(7pi/2)=100
LDI r12, 57
LDI r13, 228
LINE r10, r11, r12, r13, r31

; Segment 21: t=21pi/12 => x=57, y=228
LDI r10, 57
LDI r11, 228
; t=22pi/12 => sin(22pi/4)=sin(11pi/2)=-100, sin(22pi/6)=sin(11pi/3)=87
LDI r12, 28
LDI r13, 215
LINE r10, r11, r12, r13, r31

; Segment 22: t=22pi/12 => x=28, y=215
LDI r10, 28
LDI r11, 215
; t=23pi/12 => sin(23pi/4)=sin(7pi/4)=-71, sin(23pi/6)=sin(11pi/6)=-50
LDI r12, 57
LDI r13, 78
LINE r10, r11, r12, r13, r31

; Segment 23: t=23pi/12 => x=57, y=78 -> back to start (128,128)
LDI r10, 57
LDI r11, 78
LDI r12, 128
LDI r13, 128
LINE r10, r11, r12, r13, r31

HALT
