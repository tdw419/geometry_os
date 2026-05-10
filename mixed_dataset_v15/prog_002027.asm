; DESCRIPTION: Places a cyan 98x46 rectangle at position (246, 98).
; PLAN: r0=246(x), r1=98(y), r2=98(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 98
LDI r2, 98
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
