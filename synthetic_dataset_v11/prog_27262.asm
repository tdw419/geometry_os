; DESCRIPTION: Places a cyan 48x74 rectangle at position (22, 20).
; PLAN: r0=22(x), r1=20(y), r2=48(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 20
LDI r2, 48
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
