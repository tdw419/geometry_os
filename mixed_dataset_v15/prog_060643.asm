; DESCRIPTION: Renders a white box of size 57x53 starting at (443, 143).
; PLAN: r0=443(x), r1=143(y), r2=57(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 143
LDI r2, 57
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
