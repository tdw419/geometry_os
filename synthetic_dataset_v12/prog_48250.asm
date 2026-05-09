; DESCRIPTION: Renders a cyan box of size 34x120 starting at (62, 104).
; PLAN: r0=62(x), r1=104(y), r2=34(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 104
LDI r2, 34
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
