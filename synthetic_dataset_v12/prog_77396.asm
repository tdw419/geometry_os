; DESCRIPTION: Renders a white box of size 82x45 starting at (224, 207).
; PLAN: r0=224(x), r1=207(y), r2=82(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 207
LDI r2, 82
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
