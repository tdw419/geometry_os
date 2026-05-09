; DESCRIPTION: Places a cyan 51x90 rectangle at position (48, 151).
; PLAN: r0=48(x), r1=151(y), r2=51(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 151
LDI r2, 51
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
