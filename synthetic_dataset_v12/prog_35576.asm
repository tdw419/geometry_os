; DESCRIPTION: Renders a white box of size 87x37 starting at (403, 117).
; PLAN: r0=403(x), r1=117(y), r2=87(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 117
LDI r2, 87
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
