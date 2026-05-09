; DESCRIPTION: Places a cyan 20x51 rectangle at position (236, 199).
; PLAN: r0=236(x), r1=199(y), r2=20(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 199
LDI r2, 20
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
