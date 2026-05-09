; DESCRIPTION: Places a cyan 11x25 rectangle at position (247, 173).
; PLAN: r0=247(x), r1=173(y), r2=11(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 173
LDI r2, 11
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
