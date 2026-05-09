; DESCRIPTION: Places a red 77x111 rectangle at position (332, 109).
; PLAN: r0=332(x), r1=109(y), r2=77(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 109
LDI r2, 77
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
