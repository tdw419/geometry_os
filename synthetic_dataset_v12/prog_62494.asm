; DESCRIPTION: Renders a white box of size 103x26 starting at (120, 202).
; PLAN: r0=120(x), r1=202(y), r2=103(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 202
LDI r2, 103
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
