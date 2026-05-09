; DESCRIPTION: Places a cyan 57x46 rectangle at position (264, 206).
; PLAN: r0=264(x), r1=206(y), r2=57(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 206
LDI r2, 57
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
