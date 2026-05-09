; DESCRIPTION: Places a cyan 48x25 rectangle at position (236, 175).
; PLAN: r0=236(x), r1=175(y), r2=48(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 175
LDI r2, 48
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
