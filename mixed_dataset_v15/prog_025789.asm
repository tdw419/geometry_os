; DESCRIPTION: Places a red 40x28 rectangle at position (223, 124).
; PLAN: r0=223(x), r1=124(y), r2=40(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 124
LDI r2, 40
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
