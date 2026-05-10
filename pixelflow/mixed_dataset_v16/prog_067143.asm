; DESCRIPTION: Places a cyan 38x113 box at position (109, 187).
; PLAN: r0=109(x), r1=187(y), r2=38(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 187
LDI r2, 38
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
