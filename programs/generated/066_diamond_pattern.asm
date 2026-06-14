; DIAMOND PATTERN -- Nested diamond shapes at screen center
; 8 nested diamonds with rainbow colors, drawn as 4 lines each

; Dark background
LDI r0, 0x080818
FILL r0

; Center coordinates
LDI r20, 128
LDI r21, 128

; Diamond 1 - size 10, red
LDI r2, 10
LDI r9, 0xFF0000
; Top to Right
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
; Right to Bottom
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
; Bottom to Left
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
; Left to Top
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 2 - size 24, orange
LDI r2, 24
LDI r9, 0xFF8800
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 3 - size 38, yellow
LDI r2, 38
LDI r9, 0xFFFF00
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 4 - size 52, green
LDI r2, 52
LDI r9, 0x00FF00
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 5 - size 66, cyan
LDI r2, 66
LDI r9, 0x00FFFF
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 6 - size 80, blue
LDI r2, 80
LDI r9, 0x0044FF
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 7 - size 94, purple
LDI r2, 94
LDI r9, 0x8800FF
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

; Diamond 8 - size 110, magenta
LDI r2, 110
LDI r9, 0xFF00FF
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
SUB r1, r2
LDI r12, 0
ADD r12, r20
ADD r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
ADD r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
ADD r13, r2
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
LDI r1, 0
ADD r1, r21
ADD r1, r2
LDI r12, 0
ADD r12, r20
SUB r12, r2
LDI r13, 0
ADD r13, r21
LINE r0, r1, r12, r13, r9
LDI r0, 0
ADD r0, r20
SUB r0, r2
LDI r1, 0
ADD r1, r21
LDI r12, 0
ADD r12, r20
LDI r13, 0
ADD r13, r21
SUB r13, r2
LINE r0, r1, r12, r13, r9

HALT
