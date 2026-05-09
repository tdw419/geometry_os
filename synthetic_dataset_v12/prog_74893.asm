; DESCRIPTION: Renders a white box of size 103x109 starting at (57, 36).
; PLAN: r0=57(x), r1=36(y), r2=103(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 36
LDI r2, 103
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
