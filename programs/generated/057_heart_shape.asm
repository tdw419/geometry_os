; HEART SHAPE -- Red heart on dark purple background using LINE segments
; Outer heart outline + inner highlight, pre-computed heart curve points

; Dark purple background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x1A0011
RECTF r0, r1, r2, r3, r4

; Color: bright red
LDI r4, 0xFF1133

; Left curve (top to bottom point)
LDI r0, 128; LDI r1, 70; LDI r2, 115; LDI r3, 55
LINE r0, r1, r2, r3, r4
LDI r0, 115; LDI r1, 55; LDI r2, 95; LDI r3, 50
LINE r0, r1, r2, r3, r4
LDI r0, 95; LDI r1, 50; LDI r2, 78; LDI r3, 55
LINE r0, r1, r2, r3, r4
LDI r0, 78; LDI r1, 55; LDI r2, 68; LDI r3, 70
LINE r0, r1, r2, r3, r4
LDI r0, 68; LDI r1, 70; LDI r2, 65; LDI r3, 88
LINE r0, r1, r2, r3, r4
LDI r0, 65; LDI r1, 88; LDI r2, 68; LDI r3, 108
LINE r0, r1, r2, r3, r4
LDI r0, 68; LDI r1, 108; LDI r2, 78; LDI r3, 125
LINE r0, r1, r2, r3, r4
LDI r0, 78; LDI r1, 125; LDI r2, 95; LDI r3, 140
LINE r0, r1, r2, r3, r4
LDI r0, 95; LDI r1, 140; LDI r2, 110; LDI r3, 152
LINE r0, r1, r2, r3, r4
LDI r0, 110; LDI r1, 152; LDI r2, 128; LDI r3, 160
LINE r0, r1, r2, r3, r4

; Right curve (bottom point to top)
LDI r0, 128; LDI r1, 160; LDI r2, 146; LDI r3, 152
LINE r0, r1, r2, r3, r4
LDI r0, 146; LDI r1, 152; LDI r2, 161; LDI r3, 140
LINE r0, r1, r2, r3, r4
LDI r0, 161; LDI r1, 140; LDI r2, 178; LDI r3, 125
LINE r0, r1, r2, r3, r4
LDI r0, 178; LDI r1, 125; LDI r2, 188; LDI r3, 108
LINE r0, r1, r2, r3, r4
LDI r0, 188; LDI r1, 108; LDI r2, 191; LDI r3, 88
LINE r0, r1, r2, r3, r4
LDI r0, 191; LDI r1, 88; LDI r2, 188; LDI r3, 70
LINE r0, r1, r2, r3, r4
LDI r0, 188; LDI r1, 70; LDI r2, 178; LDI r3, 55
LINE r0, r1, r2, r3, r4
LDI r0, 178; LDI r1, 55; LDI r2, 161; LDI r3, 50
LINE r0, r1, r2, r3, r4
LDI r0, 161; LDI r1, 50; LDI r2, 141; LDI r3, 55
LINE r0, r1, r2, r3, r4
LDI r0, 141; LDI r1, 55; LDI r2, 128; LDI r3, 70
LINE r0, r1, r2, r3, r4

; Inner highlight (smaller heart, brighter red)
LDI r4, 0xFF4466
LDI r0, 128; LDI r1, 85; LDI r2, 120; LDI r3, 75
LINE r0, r1, r2, r3, r4
LDI r0, 120; LDI r1, 75; LDI r2, 108; LDI r3, 72
LINE r0, r1, r2, r3, r4
LDI r0, 108; LDI r1, 72; LDI r2, 98; LDI r3, 78
LINE r0, r1, r2, r3, r4
LDI r0, 98; LDI r1, 78; LDI r2, 92; LDI r3, 90
LINE r0, r1, r2, r3, r4
LDI r0, 92; LDI r1, 90; LDI r2, 95; LDI r3, 105
LINE r0, r1, r2, r3, r4
LDI r0, 95; LDI r1, 105; LDI r2, 105; LDI r3, 120
LINE r0, r1, r2, r3, r4
LDI r0, 105; LDI r1, 120; LDI r2, 118; LDI r3, 135
LINE r0, r1, r2, r3, r4
LDI r0, 118; LDI r1, 135; LDI r2, 128; LDI r3, 145
LINE r0, r1, r2, r3, r4
LDI r0, 128; LDI r1, 145; LDI r2, 138; LDI r3, 135
LINE r0, r1, r2, r3, r4
LDI r0, 138; LDI r1, 135; LDI r2, 151; LDI r3, 120
LINE r0, r1, r2, r3, r4
LDI r0, 151; LDI r1, 120; LDI r2, 161; LDI r3, 105
LINE r0, r1, r2, r3, r4
LDI r0, 161; LDI r1, 105; LDI r2, 164; LDI r3, 90
LINE r0, r1, r2, r3, r4
LDI r0, 164; LDI r1, 90; LDI r2, 158; LDI r3, 78
LINE r0, r1, r2, r3, r4
LDI r0, 158; LDI r1, 78; LDI r2, 148; LDI r3, 72
LINE r0, r1, r2, r3, r4
LDI r0, 148; LDI r1, 72; LDI r2, 136; LDI r3, 75
LINE r0, r1, r2, r3, r4
LDI r0, 136; LDI r1, 75; LDI r2, 128; LDI r3, 85
LINE r0, r1, r2, r3, r4

; Small highlight glint on upper left
LDI r4, 0xFFAACC
LDI r0, 105; LDI r1, 82; LDI r2, 98; LDI r3, 78
LINE r0, r1, r2, r3, r4
LDI r0, 98; LDI r1, 78; LDI r2, 95; LDI r3, 85
LINE r0, r1, r2, r3, r4

HALT
