; DESCRIPTION: Renders a cyan box of size 110x31 starting at (386, 103).
; PLAN: r0=386(x), r1=103(y), r2=110(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 103
LDI r2, 110
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
