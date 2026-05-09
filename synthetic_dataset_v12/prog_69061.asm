; DESCRIPTION: Places a cyan 83x50 rectangle at position (401, 25).
; PLAN: r0=401(x), r1=25(y), r2=83(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 25
LDI r2, 83
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
