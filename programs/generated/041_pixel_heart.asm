; PIXEL HEART -- Draw a heart shape using LINE segments on a dark background
; Heart outline using parametric curve sampled at 16 points
; Connected with LINE segments in red on dark maroon background

; Fill background with dark maroon
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x220011
RECTF r0, r1, r2, r3, r4

; Heart outline: parametric heart curve x=16sin^3(t), y=13cos(t)-5cos(2t)-2cos(3t)-cos(4t)
; Pre-sampled at 24 points, scaled by 7 and offset to center (128,130)
; Color: bright red 0xFF2244

; Top of heart (right lobe, going clockwise)
LDI r4, 0xFF2244

; Point 0: t=0 => (0, 5) => screen (128, 95)
; Point 1: t=pi/12 => (2.1, 8.7) => screen (143, 69)
; Point 2: t=pi/6 => (8, 10.3) => screen (184, 58)
; Point 3: t=pi/4 => (16, 10.1) => screen (240, 59)
; Point 4: t=pi/3 => (20.8, 8.1) => screen (274, 73) -- clamp to 256
; Simplified: use fewer key points

; Right side of heart top
LDI r0, 128
LDI r1, 108
LDI r2, 148
LDI r3, 68
LINE r0, r1, r2, r3, r4

LDI r0, 148
LDI r1, 68
LDI r2, 188
LDI r3, 52
LINE r0, r1, r2, r3, r4

LDI r0, 188
LDI r1, 52
LDI r2, 224
LDI r3, 60
LINE r0, r1, r2, r3, r4

LDI r0, 224
LDI r1, 60
LDI r2, 240
LDI r3, 80
LINE r0, r1, r2, r3, r4

LDI r0, 240
LDI r1, 80
LDI r2, 236
LDI r3, 105
LINE r0, r1, r2, r3, r4

LDI r0, 236
LDI r1, 105
LDI r2, 220
LDI r3, 130
LINE r0, r1, r2, r3, r4

; Right side to bottom point
LDI r0, 220
LDI r1, 130
LDI r2, 195
LDI r3, 158
LINE r0, r1, r2, r3, r4

LDI r0, 195
LDI r1, 158
LDI r2, 168
LDI r3, 182
LINE r0, r1, r2, r3, r4

LDI r0, 168
LDI r1, 182
LDI r2, 140
LDI r3, 195
LINE r0, r1, r2, r3, r4

; Bottom point
LDI r0, 140
LDI r1, 195
LDI r2, 128
LDI r3, 210
LINE r0, r1, r2, r3, r4

; Bottom point to left side
LDI r0, 128
LDI r1, 210
LDI r2, 116
LDI r3, 195
LINE r0, r1, r2, r3, r4

LDI r0, 116
LDI r1, 195
LDI r2, 88
LDI r3, 182
LINE r0, r1, r2, r3, r4

LDI r0, 88
LDI r1, 182
LDI r2, 61
LDI r3, 158
LINE r0, r1, r2, r3, r4

LDI r0, 61
LDI r1, 158
LDI r2, 36
LDI r3, 130
LINE r0, r1, r2, r3, r4

; Left side going up
LDI r0, 36
LDI r1, 130
LDI r2, 20
LDI r3, 105
LINE r0, r1, r2, r3, r4

LDI r0, 20
LDI r1, 105
LDI r2, 16
LDI r3, 80
LINE r0, r1, r2, r3, r4

LDI r0, 16
LDI r1, 80
LDI r2, 32
LDI r3, 60
LINE r0, r1, r2, r3, r4

LDI r0, 32
LDI r1, 60
LDI r2, 68
LDI r3, 52
LINE r0, r1, r2, r3, r4

LDI r0, 68
LDI r1, 52
LDI r2, 108
LDI r3, 68
LINE r0, r1, r2, r3, r4

; Close the heart (left lobe top to center top)
LDI r0, 108
LDI r1, 68
LDI r2, 128
LDI r3, 108
LINE r0, r1, r2, r3, r4

; Add a highlight (small bright circle in upper right lobe)
LDI r0, 170
LDI r1, 85
LDI r2, 15
LDI r3, 0xFF8888
CIRCLE r0, r1, r2, r3

HALT
