; DESCRIPTION: Places a cyan 90x76 box at position (214, 194).
; PLAN: r0=214(x), r1=194(y), r2=90(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 194
LDI r2, 90
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
