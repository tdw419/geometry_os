; DESCRIPTION: Composite: . Then Draws a white rectangle at (199, 85) with width 52 and height 75. Then Draws a cyan line from (42, 180) to (39, 152).
; PLAN: r0=199(x), r1=85(y), r2=52(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=42(x1), r1=180(y1), r2=39(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (199, 85) with width 52 and height 75.
; PLAN: r0=199(x), r1=85(y), r2=52(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 85
LDI r2, 52
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (42, 180) to (39, 152).
; PLAN: r0=42(x1), r1=180(y1), r2=39(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 180
LDI r2, 39
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
