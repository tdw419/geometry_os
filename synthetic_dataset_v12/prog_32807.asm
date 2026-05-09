; DESCRIPTION: Places a cyan 54x72 rectangle at position (302, 72).
; PLAN: r0=302(x), r1=72(y), r2=54(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 72
LDI r2, 54
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
