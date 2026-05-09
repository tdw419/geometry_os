; DESCRIPTION: Places a white 96x39 rectangle at position (109, 192).
; PLAN: r0=109(x), r1=192(y), r2=96(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 192
LDI r2, 96
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
