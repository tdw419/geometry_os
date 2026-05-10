; DESCRIPTION: Places a cyan 71x36 rectangle at position (310, 96).
; PLAN: r0=310(x), r1=96(y), r2=71(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 96
LDI r2, 71
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
