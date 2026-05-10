; DESCRIPTION: Places a cyan 29x39 rectangle at position (395, 50).
; PLAN: r0=395(x), r1=50(y), r2=29(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 50
LDI r2, 29
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
