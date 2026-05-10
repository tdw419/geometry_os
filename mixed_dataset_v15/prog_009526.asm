; DESCRIPTION: Places a cyan 21x30 box at position (322, 27).
; PLAN: r0=322(x), r1=27(y), r2=21(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 27
LDI r2, 21
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
