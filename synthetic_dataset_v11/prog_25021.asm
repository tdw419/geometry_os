; DESCRIPTION: Places a cyan 66x38 rectangle at position (36, 83).
; PLAN: r0=36(x), r1=83(y), r2=66(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 83
LDI r2, 66
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
