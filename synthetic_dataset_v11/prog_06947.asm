; DESCRIPTION: Places a cyan 91x91 rectangle at position (137, 46).
; PLAN: r0=137(x), r1=46(y), r2=91(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 46
LDI r2, 91
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
