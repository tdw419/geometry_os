; DESCRIPTION: Renders a white box of size 103x33 starting at (394, 75).
; PLAN: r0=394(x), r1=75(y), r2=103(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 75
LDI r2, 103
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
