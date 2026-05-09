; DESCRIPTION: Places a cyan 101x109 rectangle at position (46, 14).
; PLAN: r0=46(x), r1=14(y), r2=101(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 14
LDI r2, 101
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
