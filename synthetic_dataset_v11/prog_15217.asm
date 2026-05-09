; DESCRIPTION: Places a cyan 118x52 rectangle at position (130, 146).
; PLAN: r0=130(x), r1=146(y), r2=118(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 146
LDI r2, 118
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
