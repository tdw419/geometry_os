; DESCRIPTION: Places a cyan 34x15 rectangle at position (253, 96).
; PLAN: r0=253(x), r1=96(y), r2=34(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 96
LDI r2, 34
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
