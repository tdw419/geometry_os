; DESCRIPTION: Renders a white box of size 57x39 starting at (60, 120).
; PLAN: r0=60(x), r1=120(y), r2=57(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 120
LDI r2, 57
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
