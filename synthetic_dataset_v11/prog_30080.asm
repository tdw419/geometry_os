; DESCRIPTION: Places a cyan 44x46 rectangle at position (186, 187).
; PLAN: r0=186(x), r1=187(y), r2=44(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 187
LDI r2, 44
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
