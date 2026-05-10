; DESCRIPTION: Renders a cyan box of size 38x53 starting at (440, 61).
; PLAN: r0=440(x), r1=61(y), r2=38(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 61
LDI r2, 38
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
