; DESCRIPTION: Renders a white box of size 54x72 starting at (428, 82).
; PLAN: r0=428(x), r1=82(y), r2=54(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 82
LDI r2, 54
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
