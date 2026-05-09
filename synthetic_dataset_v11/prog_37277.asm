; DESCRIPTION: Places a cyan 62x68 rectangle at position (129, 146).
; PLAN: r0=129(x), r1=146(y), r2=62(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 146
LDI r2, 62
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
