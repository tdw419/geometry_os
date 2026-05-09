; DESCRIPTION: Composite: . Then Renders a white box of size 10x42 starting at (198, 57). Then Places a purple dot at position (177, 38).
; PLAN: r0=198(x), r1=57(y), r2=10(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 10x42 starting at (198, 57).
; PLAN: r0=198(x), r1=57(y), r2=10(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 57
LDI r2, 10
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (177, 38).
; PLAN: r0=177(x), r1=38(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 38
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
