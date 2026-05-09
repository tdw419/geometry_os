; DESCRIPTION: Places a white 96x112 rectangle at position (237, 30).
; PLAN: r0=237(x), r1=30(y), r2=96(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 30
LDI r2, 96
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
