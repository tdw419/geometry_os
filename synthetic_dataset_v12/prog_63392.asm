; DESCRIPTION: Places a cyan 111x84 rectangle at position (126, 18).
; PLAN: r0=126(x), r1=18(y), r2=111(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 18
LDI r2, 111
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
