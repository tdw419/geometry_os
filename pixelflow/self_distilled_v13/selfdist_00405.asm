; DESCRIPTION: Places a cyan 55x43 box at position (128, 46).
; PLAN: r0=128(x), r1=46(y), r2=55(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 46
LDI r2, 55
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
