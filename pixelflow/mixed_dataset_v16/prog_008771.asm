; DESCRIPTION: Places a cyan 61x29 rectangle at position (140, 64).
; PLAN: r0=140(x), r1=64(y), r2=61(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 64
LDI r2, 61
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
