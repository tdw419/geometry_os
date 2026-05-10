; DESCRIPTION: Places a white 27x94 rectangle at position (169, 128).
; PLAN: r0=169(x), r1=128(y), r2=27(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 128
LDI r2, 27
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
