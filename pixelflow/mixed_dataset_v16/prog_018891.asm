; DESCRIPTION: Draws a red rectangle at (308, 186) with width 38 and height 60.
; PLAN: r0=308(x), r1=186(y), r2=38(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 186
LDI r2, 38
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
