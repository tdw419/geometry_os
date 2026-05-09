; DESCRIPTION: Places a cyan 80x51 rectangle at position (10, 27).
; PLAN: r0=10(x), r1=27(y), r2=80(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 27
LDI r2, 80
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
