; DESCRIPTION: Composite: . Then Draws a black line from (97, 93) to (126, 93). Then Creates a white rectangular region at (124, 41) spanning 50 by 48 pixels.
; PLAN: r0=97(x1), r1=93(y1), r2=126(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=41(y), r2=50(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (97, 93) to (126, 93).
; PLAN: r0=97(x1), r1=93(y1), r2=126(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 93
LDI r2, 126
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white rectangular region at (124, 41) spanning 50 by 48 pixels.
; PLAN: r0=124(x), r1=41(y), r2=50(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 41
LDI r2, 50
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
