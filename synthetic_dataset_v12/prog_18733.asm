; DESCRIPTION: Places a cyan 48x87 rectangle at position (114, 114).
; PLAN: r0=114(x), r1=114(y), r2=48(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 114
LDI r2, 48
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
