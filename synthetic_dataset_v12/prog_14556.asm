; DESCRIPTION: Places a white 80x34 rectangle at position (205, 177).
; PLAN: r0=205(x), r1=177(y), r2=80(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 177
LDI r2, 80
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
