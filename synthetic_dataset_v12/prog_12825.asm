; DESCRIPTION: Places a cyan 91x47 rectangle at position (50, 18).
; PLAN: r0=50(x), r1=18(y), r2=91(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 18
LDI r2, 91
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
