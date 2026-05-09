; DESCRIPTION: Composite: . Then Places a red 87x29 rectangle at position (90, 32). Then Renders a white line between points (137, 64) and (4, 39).
; PLAN: r0=90(x), r1=32(y), r2=87(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x1), r1=64(y1), r2=4(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 87x29 rectangle at position (90, 32).
; PLAN: r0=90(x), r1=32(y), r2=87(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 32
LDI r2, 87
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (137, 64) and (4, 39).
; PLAN: r0=137(x1), r1=64(y1), r2=4(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 64
LDI r2, 4
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
