; DESCRIPTION: Places a cyan 107x59 rectangle at position (206, 105).
; PLAN: r0=206(x), r1=105(y), r2=107(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 105
LDI r2, 107
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
