; DESCRIPTION: Composite: . Then Draws a magenta line from (25, 157) to (239, 230). Then Creates a purple rectangular region at (87, 152) spanning 107 by 32 pixels.
; PLAN: r0=25(x1), r1=157(y1), r2=239(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=87(x), r1=152(y), r2=107(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta line from (25, 157) to (239, 230).
; PLAN: r0=25(x1), r1=157(y1), r2=239(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 157
LDI r2, 239
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (87, 152) spanning 107 by 32 pixels.
; PLAN: r0=87(x), r1=152(y), r2=107(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 152
LDI r2, 107
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
