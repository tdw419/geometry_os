; DESCRIPTION: Renders a white box of size 54x80 starting at (425, 42).
; PLAN: r0=425(x), r1=42(y), r2=54(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 42
LDI r2, 54
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
