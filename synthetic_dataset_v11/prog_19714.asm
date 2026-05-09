; DESCRIPTION: Places a cyan 63x116 rectangle at position (191, 19).
; PLAN: r0=191(x), r1=19(y), r2=63(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 19
LDI r2, 63
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
